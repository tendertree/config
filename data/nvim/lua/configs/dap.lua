print('loading node config')

local dap = require 'dap'

local js_based_languages = {
	"typescript", "javascript", "javascriptreact", "typescriptreact",
	-- using pwa-chrome
}

for _, language in ipairs(js_based_languages) do
	dap.configurations[language] = {


		{
			type = 'pwa-node',
			request = 'launch',
			name = 'Launch curret files- tsnode (Typescript)',
			cwd = "${workspaceFolder}",
			--runtimeArgs = { '--loader=ts-node' },
			program = "${file}",
			runtimeExecutable = 'ts-node',
			-- args = { '${file}' },
			sourceMaps = true,
			protocol = 'inspector',
			outFiles = { "${workspaceFolder}/**/**/*", "!**/node_modules/**" },
			skipFiles = { '<node_internals>/**', 'node_modules/**' },
			resolveSourceMapLocations = {
				"${workspaceFolder}/**",
				"!**/node_modules/**",
			},
		}
	}
end

require('dap-vscode-js').setup({
	-- node_path = "node",                                                          -- Path of node executable. Defaults to $NODE_PATH, and then "node"
	debugger_path = os.getenv('HOME') .. "/.local/share/nvim/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
	-- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
	adapters = { "pwa-node", 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
	-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
	-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
	-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})


dapui = require("dapui")
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	--dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	--dapui.close()
end

require("dapui").setup()
