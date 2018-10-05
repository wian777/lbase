#!/bin/sh

usage()
{
    echo "usage: cbus_copy_ObjConfig.sh source target domain type key [ObjConfigDef-Domain-like]"
    echo "if ObjConfigDef-Domain-like is not set, all ObjConfigDef-Values are copied"
    exit 1;
}

# check's
if [ $# -lt 5 -o $# -gt 6 ]
then
	usage
fi

SOURCESID="$1"
TARGETSID="$2"
DOMAIN="$3"
TYPE="$4"
KEY="$5"
OBJDOM=""
if [ $# -eq 6 ] 
then
    OBJDOM="$6"
fi

SQL=`cat << !!EOF
    select
    obj_domain 
    || ' ' || 
    obj_type 
    || ' ' || 
    obj_key
    from
    COBJ_OBJECT
    where 1=1
    and obj_key = '${KEY}'
    and obj_type = '${TYPE}'
    and obj_domain = '${DOMAIN}'
    union
    select
    obj_domain 
    || ' ' || 
    obj_type 
    || ' ' || 
    obj_key
    from
    COBJ_OBJECT
    where 1=1
    and obj_key = 'ObjConfigDef.${TYPE}.${KEY}'
    and OBJ_TYPE = 'Config'
    and obj_domain like '${OBJDOM}%' 
!!EOF`

echo "${SQL}" | $TRFL/sh/tools/cbus_copy.sh "${SOURCESID}" "${TARGETSID}" 
