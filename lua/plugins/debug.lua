return {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      lazy = true,
      config = function()
        local dap_breakpoint_color = {
          breakpoint = {
            ctermbg = 0,
            fg = '#993939',
            bg = '#31353f',
          },
          logpoing = {
            ctermbg = 0,
            fg = '#61afef',
            bg = '#31353f',
          },
          stopped = {
            ctermbg = 0,
            fg = '#98c379',
            bg = '#31353f'
          },
        }

        vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
        vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
        vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)

        local dap_breakpoint = {
          error = {
            text = "",
            texthl = "DapBreakpoint",
            linehl = "DapBreakpoint",
            numhl = "DapBreakpoint",
          },
          condition = {
            text = 'ﳁ',
            texthl = 'DapBreakpoint',
            linehl = 'DapBreakpoint',
            numhl = 'DapBreakpoint',
          },
          rejected = {
            text = "",
            texthl = "DapBreakpint",
            linehl = "DapBreakpoint",
            numhl = "DapBreakpoint",
          },
          logpoint = {
            text = '',
            texthl = 'DapLogPoint',
            linehl = 'DapLogPoint',
            numhl = 'DapLogPoint',
          },
          stopped = {
            text = '',
            texthl = 'DapStopped',
            linehl = 'DapStopped',
            numhl = 'DapStopped',
          },
        }

        vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
        vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
        vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
        vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
        vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)

        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end

        dap.adapters.cppdbg = {
          id = "cppdbg",
          type = "executable",
          command = "/home/tlp/.local/share/nvim/mason/bin/OpenDebugAD7",
        }
        dap.configurations.cpp = {
          {
            name = "Launch file",
            type = "cppdbg",
            request = "launch",
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopAtEntry = false,
          },
        }
        dap.configurations.c = dap.configurations.cpp
      end
    },
    config = function ()
      require("dapui").setup({

      })
    end
  }
}
