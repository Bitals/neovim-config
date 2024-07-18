return{
	update = function()
		local startMessage = "Checking for User configuration updates"
		local notificationId = require("utils.notifier").notify{startMessage, nil, 50000}
		local output = tostring(io.popen("cd "..vim.fn.stdpath("config").." && git fetch && git pull"):read("a"))
		require("utils.notifier").notify{output, notificationId, 10000}
	end
}
