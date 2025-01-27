
return {
  "puremourning/vimspector",
  config = function()

  -- Global configuration settings
  vim.g.vimspector_enable_mappings = 'HUMAN'  -- Use human-friendly mappings

  -- Custom signs for breakpoints and debugging
  vim.fn.sign_define('vimspectorBP', { text="🔴", texthl='', linehl='', numhl='' })
  vim.fn.sign_define('vimspectorBPCond', { text="🟡", texthl='', linehl='', numhl='' })
  vim.fn.sign_define('vimspectorBPDisabled', { text="⚪", texthl='', linehl='', numhl='' })
  vim.fn.sign_define('vimspectorPC', { text="▶️", texthl='', linehl='', numhl='' })
  vim.fn.sign_define('vimspectorPCBP', { text="🔵", texthl='', linehl='', numhl='' })

  -- Keymappings
  local function map(mode, lhs, rhs, opts)
      local options = { noremap = true, silent = true }
      if opts then options = vim.tbl_extend('force', options, opts) end
      vim.keymap.set(mode, lhs, rhs, options)
  end


  -- Set up autocommands for debugging
  -- local debugGroup = vim.api.nvim_create_augroup('VimspectorGroup', { clear = true })
  -- vim.api.nvim_create_autocmd('FileType', {
  --     pattern = { 'python', 'cpp', 'c', 'javascript' },
  --     group = debugGroup,
  --     callback = function()
  --         vim.b.vimspector_enable_mappings = 1
  --     end,
  -- })

  -- Fixed configurations structure for different languages
vim.g.vimspector_configurations = {
    -- Python
    ["Python: Launch"] = {
        configuration = {
            adapter = 'debugpy',
            name = 'Python: Launch',
            type = 'python',
            request = 'launch',
            program = '${file}',
            default = true
        }
    },

    -- C and C++
    ["C++: Launch"] = {
        configuration = {
            adapter = 'vscode-cpptools',
            name = 'C++: Launch',
            type = 'cppdbg',
            request = 'launch',
            program = '${fileDirname}/${fileBasenameNoExtension}.out',
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            default = true,
            args = {},
            setupCommands = {
                {
                    text = '-enable-pretty-printing',
                    description = 'enable pretty printing',
                    ignoreFailures = false
                },
            }
        }
    },

    -- Go
    ["Go: Launch"] = {
        configuration = {
            adapter = 'delve',
            name = 'Go: Launch',
            type = 'go',
            request = 'launch',
            program = '${fileDirname}',
            mode = 'debug',
            default = true
        }
    },

    -- Java
    ["Java: Launch"] = {
        configuration = {
            adapter = 'vscode-java-debug',
            name = 'Java: Launch',
            type = 'java',
            request = 'launch',
            mainClass = '${file}',
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},
            default = true
        }
    },

    -- PHP
    ["PHP: Launch"] = {
        configuration = {
            adapter = 'vscode-php-debug',
            name = 'PHP: Launch',
            type = 'php',
            request = 'launch',
            program = '${file}',
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},
            default = true
        }
    },

    -- Bash
    ["Bash: Launch"] = {
        configuration = {
            adapter = 'vscode-bash-debug',
            name = 'Bash: Launch',
            type = 'bashdb',
            request = 'launch',
            program = '${file}',
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},
            default = true
        }
    },

    -- Lua
    ["Lua: Launch"] = {
        configuration = {
            adapter = 'Tocal-lua-debugger-vscode',
            name = 'Lua: Launch',
            type = 'local-lua',
            request = 'launch',
            program = '${file}',
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},
            default = true
        }
    }
}
  -- Helper function to create .vimspector.json in the current directory
vim.api.nvim_create_user_command('VimspectorCreateConfig', function()
    local current_filetype = vim.bo.filetype
    local config = {
        configurations = {},
    }

    -- Map file types to configuration types
    local filetype_to_config_type = {
        cpp = 'cppdbg', -- C++ (using vscode-cpptools)
        c = 'cppdbg',   -- C (using vscode-cpptools)
        python = 'python', -- Python (using debugpy)
        go = 'delve', -- Go (using delve)
        java = 'java', -- Java (using vscode-java-debug)
        sh = 'bashdb', -- Bash (using bashdb)
        lua = 'local-lua', -- Lua (using local-lua-debugger)
        php = 'php', -- PHP (using vscode-php-debug)
    }

    -- Get the configuration type for the current file type
    local config_type = filetype_to_config_type[current_filetype]

    -- Find the matching configuration
    for config_name, config_data in pairs(vim.g.vimspector_configurations) do
        if config_data.configuration and config_data.configuration.type == config_type then
            config.configurations[config_name] = config_data.configuration
            break
        end
    end

    -- If no configuration was found, notify the user
    if vim.tbl_isempty(config.configurations) then
        print('No Vimspector configuration found for filetype: ' .. current_filetype)
        return
    end

    -- Convert the configuration to a JSON string
    local json_string = vim.fn.json_encode(config)

    -- Use Python's json.tool to pretty-print the JSON
    local formatted_json = vim.fn.system('python3 -m json.tool', json_string)

    -- Check if the formatting was successful
    if vim.v.shell_error ~= 0 then
        print('Failed to format JSON. Ensure Python 3 is installed.')
        return
    end
    
    -- Check if .vimspector.json already exists
    local config_file = '.vimspector.json'
    if vim.fn.filereadable(config_file) == 1 then
        -- Ask for confirmation before overriding
        local confirm = vim.fn.input('A .vimspector.json file already exists. Override it? [y/N]: ')
        if confirm:lower() ~= 'y' then
            print('Operation canceled.')
            return
        end
    end

    print("\r")

    -- Write the configuration to .vimspector.json
    local file = io.open('.vimspector.json', 'w')
    if file then
        file:write(formatted_json)
        file:close()
        print('Created .vimspector.json for ' .. current_filetype)
    else
        print('Failed to create .vimspector.json')
    end
end, {})

  end,
}
