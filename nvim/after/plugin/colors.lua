function ColorMyPencils(color)
	color = color or 'rose-pine'
	vim.cmd.colorscheme(color)
	vim.cmd('set t_Co=256')
	vim.cmd('set background=dark')
end

ColorMyPencils()
