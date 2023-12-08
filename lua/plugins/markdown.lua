return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  config = function()
    --vim.g.mkdp_command_for_global = 1
    vim.g.mkdp_browser = "chromium"
    vim.g.mkdp_auto_start = 1
  end
}
