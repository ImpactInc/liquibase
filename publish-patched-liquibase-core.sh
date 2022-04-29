cd liquibase-core

ls -lt target

mvn package -Dmaven.test.skip=true

./gradlew generatePomFileForMavenPublication

build/publications/maven/pom-default.xml

mvn deploy:deploy-file -Durl=https://nexus.gcp.inf-impact.net/repository/thirdparty \
                       -DrepositoryId=thirdparty \
                       -Dfile=target/liquibase-core-3.10.4.jar \
                       -DpomFile=build/publications/maven/pom-default.xml \
                       -DgroupId=org.liquibase \
                       -DartifactId=liquibase-core \
                       -Dversion=3.10.4 \
                       -Dpackaging=jar \
                       -DgeneratePom=false
