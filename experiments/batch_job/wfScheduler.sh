kubectl apply -f rbac-deploy.yaml
kubectl apply -f resourceUsage.yaml
sleep 5s
kubectl create ns workflow
while [ true ]
do
  state=`kubectl get ns | grep "workflow"|awk '{print $2}'`
  if [ $state == "Active" ];then
    echo "create workflow namespace successful."
    break
  fi
done

kubectl apply -f priority-job0.yaml
while [ true ]
do
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  if [ $state == "Completed" ];then
    echo "hello world."
    break
  fi
done

kubectl delete -f priority-job0.yaml

while [ true ]
do
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  if [ ! $state ];then
    echo "delete priority-job0.yaml successful."
    break
  fi
done

kubectl apply -f priority-job1234.yaml
while [ true ]
do
  accbool=1
  i=0
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  for bo in $state
  do
    echo $i
    echo $bo
    if [ $bo == "Completed" ];then
      accbool=$(($accbool && 1))
      echo $accbool
    else
      accbool=$(($accbool && 0))
      echo $accbool
    fi
    i=$(($i+1))
  done
  if [ $accbool -eq 1 ];then
    break
  fi
done

kubectl delete -f priority-job1234.yaml
while [ true ]
do
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  if [ ! $state ];then
    echo "delete priority-job1234.yaml successful."
    break
  fi
done

kubectl apply -f priority-job56.yaml
while [ true ]
do
  accbool=1
  i=0
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  for bo in $state
  do
    echo $i
    echo $bo
    if [ $bo == "Completed" ];then
      accbool=$(($accbool && 1))
      echo $accbool
    else
      accbool=$(($accbool && 0))
      echo $accbool
    fi
    i=$(($i+1))
  done
  if [ $accbool -eq 1 ];then
    break
  fi
done

kubectl delete -f priority-job56.yaml
while [ true ]
do
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  if [ ! $state ];then
    echo "delete priority-job56.yaml successful."
    break
  fi
done

kubectl apply -f priority-job7.yaml
while [ true ]
do
  accbool=1
  i=0
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  for bo in $state
  do
    echo $i
    echo $bo
    if [ $bo == "Completed" ];then
      accbool=$(($accbool && 1))
      echo $accbool
    else
      accbool=$(($accbool && 0))
      echo $accbool
    fi
    i=$(($i+1))
  done
  if [ $accbool -eq 1 ];then
    break
  fi
done

kubectl delete -f priority-job7.yaml
while [ true ]
do
  state=`kubectl get pods -A |grep "task"| awk '{print $4}'`
  if [ ! $state ];then
    echo "delete priority-job7.yaml successful."
    break
  fi
done

kubectl delete ns workflow
while [ true ]
do
  state=`kubectl get ns | grep "workflow"|awk '{print $2}'`
  if [ ! $state ];then
    echo "delete workflow namespace successful."
    break
  fi
done

kubectl delete -f rbac-deploy.yaml
kubectl delete -f resourceUsage.yaml
echo "tasks is over."

