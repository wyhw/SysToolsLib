###############################################################################
#                                                                             #
#   File name:      cpuid.mak                                                 #
#                                                                             #
#   Description:    Specific rules for building cpuid.exe.                    #
#                                                                             #
#   Notes:          cpuid is a DOS/WIN32 program only.                        #
#                                                                             #
#   History:                                                                  #
#    2012-10-18 JFL jf.larvoire@hp.com created this file.                     #
#    2016-04-17 JFL Avoid building the DOS version if missing required libs.  #
#    2017-05-17 JFL Prevent a link warning U4004: too many rules for target.  #
#                                                                             #
#         � Copyright 2016 Hewlett Packard Enterprise Development LP          #
# Licensed under the Apache 2.0 license - www.apache.org/licenses/LICENSE-2.0 #
###############################################################################

!IF "$(T)"=="DOS" && ("$(HAS_BIOSLIB)"!="1" || "$(HAS_LODOSLIB)"!="1" || "$(HAS_PMODELIB)"!="1")
complain:
	@echo>con The DOS version of this program requires the BIOSLIB, LODOSLIB, and PMODE libraries.

dirs $(O)\cpuid.obj $(B)\cpuid.exe: complain
	@rem Do nothing as we don't have the necessary libraries
!ENDIF

!IF "$(T)"=="WIN64"
complain:
	@echo>con There's no WIN64 version of this program yet.

dirs $(O)\cpuid.obj $(B)\cpuid.exe: complain
	@rem Do nothing as there's nothing to do

EXENAME=no_such.exe	# Prevent the win32.mak $(B)\$(EXENAME) inference rule from conflicting with this one.
!ENDIF

