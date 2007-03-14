#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = Taint::Util PACKAGE = Taint::Util

void
tainted(SV *sv)
PPCODE:
    if (SvTAINTED(sv))
        XPUSHs(&PL_sv_yes);
    else
        XPUSHs(&PL_sv_no);

void
taint(SV * sv)
PPCODE:
    SvTAINTED_on(sv);

void
untaint(SV * sv)
PPCODE:
    SvTAINTED_off(sv);
