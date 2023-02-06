return {
-- Comments
  {
    "numToStr/Comment.nvim",
    config = true,
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    event = "User FileOpened",
  },
}
