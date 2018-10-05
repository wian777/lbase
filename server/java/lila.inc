LI_JAR="eu.lbase.lis.app.jar"

JRE_EXE="${JRE_EXE:=/opt/lbase/li_next/jre/client/jre/bin/java}"

if [ ! -x "${JRE_EXE}" ]
then
	JRE_EXE=java
fi

