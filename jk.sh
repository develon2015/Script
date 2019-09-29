#!/bin/bash
kotlin='/snap/kotlin/current/lib'
CLASSPATH='.'

if (($#<1)); then
        echo \
"jk -cp ./target.jar -cp 'tomcat/lib/*spring*.jar' <Class> [参数列表...]
        使用Java运行时运行Kotlin编译的类, 添加了Kotlin运行时
        通过-cp 'classpath'来附加类路径, 通配符要用单引号''包装起来形成独立的参数
"
        exit 0
fi

function startJava() {
        CLASSPATH="$CLASSPATH:$kotlin/kotlin-stdlib.jar:$kotlin/kotlin-reflect.jar"
        #echo "类加载路径->$CLASSPATH"
        #echo "参数数量$#"
        #echo "参数->""$@"
        java -cp "$CLASSPATH" "$@"
        exit 0
}

i=0
while (($i<$#)); do
        let j=i+1
        arg=$(eval echo "$""$j")
        #echo $arg
        if [ "$arg" == "-cp" ]; then
                shift 1
                addClassPath=$(eval echo "$""$j")
                CLASSPATH="$CLASSPATH:${addClassPath// /:}" # 添加类路径, 同时替换空格为':', 方便使用通配符'*'和'?'
        else # 这里开始是类名
                javaClass="$(eval echo "$""$j")"
                #echo "执行类$javaClass"
                let k=j+1
                toJava=""
                while (($k<=$#)); do
                        toJava="$toJava '$(eval echo "$""$k")'"
                        #echo "$toJava"
                        let k++
                done
                eval startJava '"$javaClass"' $toJava
                exit 0
        fi
        let i++
done

