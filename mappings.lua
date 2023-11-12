local M = {}
local dap_sidebar = nil
M.dap = {
  plugin = true,
  n = {
    ["<leader>dl"] = { 
	    "<cmd> RustDebuggables <CR>",
	    "Launch",
    },	  
    ["<leader>db"] = { 
	    "<cmd> DapToggleBreakpoint <CR>",
	    "Toggle breakpoint",
    },
    ["<leader>dv"] = { 
	    "<cmd> DapStepOver <CR>",
	    "Step over",
    },
    ["<leader>du"] = { 
	    "<cmd> DapStepOut <CR>",
	    "Step out",
    },
    ["<leader>di"] = { 
	    "<cmd> DapStepInto <CR>",
	    "Step into",
    },
    ["<leader>dc"] = { 
	    "<cmd> DapContinue <CR>",
	    "Continue",
    },
    ["<leader>dt"] = { 
	    "<cmd> DapTerminate <CR>",
	    "Terminate",
    },
    ["<leader>ds"] = {
      function ()
        local widgets = require('dap.ui.widgets');
	if dap_sidebar == nil then
	  dap_sidebar = widgets.sidebar(widgets.scopes);
	end
        dap_sidebar.toggle();
      end,
      "Toggle sidebar"
    },
    ["<leader>dr"] = {
      function()
        require('dap').repl.toggle();
      end,
      "Open REPL",
    },
  }
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

return M
