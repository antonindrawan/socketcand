#ifndef CONFIG_H
#define CONFIG_H

#ifdef LINUX
  #include "config_linux.h"
#elif ARM_LINUX
  #include "config_armlinux.h"
#endif

#endif // CONFIG_H
