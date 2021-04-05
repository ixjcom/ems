@echo on
cd %~dp0
java  -jar E:\hjr-workspace\hjr-data\hjr-data-dal\mybatisgenerator\mybatis-generator-core-1.3.2.jar -configfile generatorConfig.xml -overwrite
pause