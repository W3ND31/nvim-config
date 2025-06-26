return {
  {
    "junegunn/vim-easy-align",
    keys = {
      { "={", "vi{<C-v>$:EasyAlign\\ g/^\\S/<CR>" },
      { "=[", "vi[<C-v>$:EasyAlign\\ g/^\\S/<CR>" },
      { "=(", "vi(<C-v>$:EasyAlign\\ g/^\\S/<CR>" },
    },
  }
}
