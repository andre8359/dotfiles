return {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        local path = "~/env/bin/python"
        require("dap-python").setup(path)
        require("dap-python").test_runner = "pytest"
    end,
}
