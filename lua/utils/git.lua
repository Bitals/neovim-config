return{
	profiler = function(opts)
		if string.find(opts, "/home/bitals/Documents/Work/Xinnor") then
			vim.env.ZDOTDIR = '/home/bitals/Documents/Work/Xinnor'
			vim.env.GIT_CONFIG_GLOBAL = '/home/bitals/Documents/Work/Xinnor/.gitconfig'
		else
			vim.env.ZDOTDIR = '/home/bitals/'
			vim.env.GIT_CONFIG_GLOBAL = '/home/bitals/.gitconfig'
		end
	end
}
