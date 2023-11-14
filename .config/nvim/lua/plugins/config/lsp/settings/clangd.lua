local opts = {}

opts.filetypes = { "c", "cpp" }
opts.root_dir = require("lspconfig.util").root_pattern({
	"Makefile", "makefile"
})

opts.settings = {
}

return opts
