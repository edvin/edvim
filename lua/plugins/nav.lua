return {
  -- Quick navigation using s and S followed by target letters
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end
  },
}
