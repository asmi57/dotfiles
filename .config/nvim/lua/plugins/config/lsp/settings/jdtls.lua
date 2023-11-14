local opts = {}

opts.filetypes = { "java" }
opts.root_dir = require("lspconfig.util").root_pattern({
	"pom.xml",
	".git"
})

return opts
