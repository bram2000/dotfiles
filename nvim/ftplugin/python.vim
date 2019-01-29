let b:ale_fixers = ['black']
" let b:ale_linters = ['flake8', 'mypy', 'pylint', 'pyls']
let b:ale_python_pylint_options = " --disable 'C0111'"
let b:ale_python_pyls_executable="pyls -v"
let b:ale_linters = ['pyls', 'pylint', 'flake8']
let b:ale_completion_enabled=1

let g:ale_python_flake8_auto_pipenv = 1
let g:ale_python_pylint_auto_pipenv = 1
let g:ale_python_pyls_auto_pipenv = 1

" Custom ctags command to include external modules
let b:fzf_tags_command = 'ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags $(python -c "import os, sys; print('' ''.join(''{}''.format(d) for d in sys.path if os.path.isdir(d)))")'
