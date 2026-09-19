c = get_config()

c.TerminalIPythonApp.display_banner = False
c.InteractiveShell.separate_in = ''
c.TerminalInteractiveShell.confirm_exit = False
c.TerminalInteractiveShell.auto_match = True
# c.InteractiveShell.ast_node_interactivity = 'last_expr_or_assign'

# c.HistoryManager.hist_file = '~/.local/state/ipython/history.sqlite'
# c.InteractiveShellApp.extensions = ['autoreload']
# c.InteractiveShellApp.exec_lines = ['%autoreload 2']
