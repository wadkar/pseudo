# Plugin configuration that goes before initialization
P9K_MODE='nerdfont-complete'
#P9K_PROMPT_ADD_NEWLINE=true
P9K_PROMPT_ON_NEWLINE=true
P9K_LEFT_PROMPT_ELEMENTS=( \
  # operating environment
  os_icon root_indicator context dir vcs \
  # runtime environment
  background_jobs status \
  )
P9K_RIGHT_PROMPT_ELEMENTS=( \
  go_version \
  node_version \
  pyenv \
)

P9K_VI_MODE_INSERT_STRING='I'
# I'm not interested in knowing `whoami`
DEFAULT_USER="$(whoami)"
