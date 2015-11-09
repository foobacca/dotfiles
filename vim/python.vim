" python with virtualenv support
py << EOF
import os

project_base_dir = None
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
elif '.ve' in os.listdir('.'):
    project_base_dir = '.ve'

if project_base_dir:
    activate_this = os.path.join(project_base_dir, 'bin', 'activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

