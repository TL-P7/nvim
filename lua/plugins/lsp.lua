return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    priority = 1000,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "cpp",
          "bash",
          "go",
          "lua",
          "vim",
        },
        highlight = {
          enable = true,
          disable = {}, -- list of language that will be disabled
        },
        indent = {
          enable = true
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection    = "<CR>",
            node_incremental  = "<CR>",
            node_decremental  = "<BS>",
            scope_incremental = "<TAB>",
          },
        }
      })
    end
  },




  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          c = true,
          cpp = false,
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
  },




  {
    "zbirenbaum/copilot-cmp",
    lazy = true,
  },






  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    config = function()
      local lsp = require("lsp-zero").preset({})
      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
      end)
      lsp.setup()
    end,
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        lazy = true,
        config = function()
          local lspconfig = require("lspconfig")
          lspconfig['lua_ls'].setup({})
          vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
              local opts = { buffer = event.buf, noremap = true, nowait = true }

              vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
              vim.keymap.set('n', 'gD', ':tab sp<CR><cmd>lua vim.lsp.buf.definition()<cr>', opts)
              vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
              vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
              vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
              --vim.keymap.set('i', '<c-f>', vim.lsp.buf.signature_help, opts)
              vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
              vim.keymap.set({ 'n', 'x' }, '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
              vim.keymap.set({ 'n', 'v' }, '<leader>sw', vim.lsp.buf.code_action, opts)
              vim.keymap.set({ 'n', 'v' }, "<leader>s", vim.lsp.buf.code_action, opts)
              vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, opts)
              vim.keymap.set('n', ']g', vim.diagnostic.goto_next, opts)
            end
          })
        end,
      },

      {
        "williamboman/mason.nvim",
        dependencies = {
          "neovim/nvim-lspconfig",
        },
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        config = function()
          require("mason").setup({
            ui = {
              icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
              },
            },
          })
        end,
      },

      {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require("mason-lspconfig").setup({
            ensure_installed = {
              "lua_ls",
            },
            automatic_installation = true,
          })
        end,
      },

      {
        "hrsh7th/nvim-cmp",

        config = function()
          local cmp = require("cmp")
          local lspkind = require("lspkind")
          local cmp_autopairs = require("nvim-autopairs.completion.cmp")
          cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
          cmp.setup({
            snippet = {
              expand = function(args)
                require("luasnip").lsp_expand(args.body)
              end,
            },

            mapping = {
              ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true
              }),
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<S-TAB>"] = cmp.mapping.select_prev_item(),
              ["<TAB>"] = cmp.mapping.select_next_item(),
              ["<C-j>"] = cmp.mapping.scroll_docs(4),
              ["<C-k>"] = cmp.mapping.scroll_docs(-4),
              ["<C-c>"] = cmp.mapping.close()
            },
            window = {
              completion = cmp.config.window.bordered(),
              documentation = cmp.config.window.bordered(),
            },


            formatting = {
              format = lspkind.cmp_format({
                with_text = true,
                maxwidth = 50,
                before = function(entry, vim_item)
                  vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                  return vim_item
                end,
              }),
            },

            --让nvim根据name里面的参数进行补全
            sources = cmp.config.sources({
              { name = "nvim_lsp" },
              { name = "buffer" },
            }, {
              { name = "path" },
              { name = "luasnip" },
            })
          })

          --git
          cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
              { name = "buffer" },
            }),
          })

          --nvim命令行补全
          cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
              { name = "path" },
            }, {
              { name = "cmdline" },
            }),
          })

          --文件内容搜索补全
          cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = 'buffer' }
            }
          })

        end,
      },

      {
        "hrsh7th/cmp-nvim-lsp",
        lazy = true
      },

      {
        "L3MON4D3/LuaSnip",
        lazy = true
      },
      {
        "saadparwaiz1/cmp_luasnip",
        lazy = true,
      },

      {
        "onsails/lspkind.nvim",
        lazy = false,
      },

      {
        "hrsh7th/cmp-buffer",
        lazy = true
      },

      {
        "hrsh7th/cmp-cmdline",
        lazy = true
      },

      {
        "hrsh7th/cmp-path",
        lazy = true
      },
      {
        "rafamadriz/friendly-snippets",
        lazy = true
      },
    },

  },
}
