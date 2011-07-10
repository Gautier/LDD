# run nosetests if any file change in this directory
DIRECTORIES = (
    ('.', 'nosetests .'),
)

IGNORE_EXTENSIONS = ('swp', )
IGNORE_DIRECTORIES = ('.git', )

# May need to configure to appropriate port
LDD_PORT = "/dev/ttyACM2"

