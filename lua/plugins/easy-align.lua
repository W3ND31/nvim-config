return {
  {
    "junegunn/vim-easy-align",
    lazy = false,
    keys = {
      { "={", "vi{<C-v>$:EasyAlign\\ g/^\\S/<CR>" },
      { "=[", "vi[<C-v>$:EasyAlign\\ g/^\\S/<CR>" },
      { "=(", "vi(<C-v>$:EasyAlign\\ g/^\\S/<CR>" },
    },
  }
}
