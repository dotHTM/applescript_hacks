install_location = "${HOME}/Library/Script Libraries/"

default:
	${MAKE} clean
	${MAKE} compile
	${MAKE} install
	

library_sources := ${wildcard ./*.applescript}
library_basenames := ${foreach file,${library_sources},`echo ${file} | perl -pe 's|\.applescript||'`}
library_compiled := ${foreach file,${library_sources},`echo ${file} | perl -pe 's|\.applescript|.scpt|'`}

${library_compiled}: compile

compile:
	${foreach file,${library_sources},osacompile -o "`echo "${file}" | perl -pe 's|\.applescript|.scpt|'`" "${file}" ;}

clean:
	-rm *.scpt

install: ${library_compiled}
	${MAKE} unlink
	${MAKE} link

unlink:
	-rm -rf "${HOME}/Library/Script Libraries"

link:
	mkdir ${install_location}
	cp ./*.scpt ${install_location}