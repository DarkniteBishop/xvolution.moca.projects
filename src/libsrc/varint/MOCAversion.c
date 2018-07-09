static char RCS_Id[] = "$Id: MOCAversion.c 196942 2009-05-27 17:46:12Z mlange $";
/*#START***********************************************************************
 *
 *  $URL: https://athena.redprairie.com/svn/prod/env/tags/2011.2.4/src/libsrc/varint/MOCAversion.c $
 *  $Revision: 196942 $
 *  $Author: mlange $
 *
 *  Description: Return the release version or build date of this 
 *               component library.
 *
 *  $Copyright-Start$
 *
 *  Copyright (c) 1999 - 2009
 *  RedPrairie Corporation
 *  All Rights Reserved
 *
 *  This software is furnished under a corporate license for use on a
 *  single computer system and can be copied (with inclusion of the
 *  above copyright) only for use on such a system.
 *
 *  The information in this document is subject to change without notice
 *  and should not be construed as a commitment by RedPrairie Corporation.
 *
 *  RedPrairie Corporation assumes no responsibility for the use of the
 *  software described in this document on equipment which has not been
 *  supplied or approved by RedPrairie Corporation.
 *
 *  $Copyright-End$
 *
 *#END************************************************************************/

#include <moca.h>

#include <stdio.h>
#include <string.h>
#include <time.h>

#ifndef RELEASE_VERSION
#define RELEASE_VERSION ""
#endif

LIBEXPORT char *MOCAversion(void)
{
    if (RELEASE_VERSION[0] == '\0')
        return "Build Date: " __DATE__;
    else
        return RELEASE_VERSION;
}
