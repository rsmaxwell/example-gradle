@echo on


set REPOSITORY=snapshots
set VERSION=1.2.3-SNAPSHOTS


./gradlew publish --no-daemon --info ^
    -Prepo=%REPOSITORY% ^
    -Pversion=%VERSION%
