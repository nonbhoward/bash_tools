#!/bin/bash
source $(dirname $0)"/local_ips.sh"
ip_target=""
ip_range="192.168.1.0-255"
args_target_ip=(
	"all-ports" "-v -p-"
	"common-ports" "-v -F"
	"detect-os" "-v -A"
	"ignore-discovery" "-v -Pn"
	"tcp-connect" "-v -sT"
	"tcp-syn" "-v -sS"
	"udp-ports" "-v -sU"
)
args_target_range=(
	"list-hosts" "-sL"
)
test_args=(
	"test-heartbleed" "nmap -v -sV -p 443 --script=ssl-heartbleed 192.168.1.0/24"
)
execute(){
	printf "executing $1\\n" && $1
}
# process arg == help
if [ $# -ne 1 ] || [ $@ == help ];then
  printf "args targeting ip : \\n"
  for idx in ${!args_target_ip[@]};do
    if [ $(($idx % 2)) -eq 0 ];then
      printf "\\t${args_target_ip[$idx]}\\n"
    fi
  done
  printf "args targeting range : \\n"
  for idx in ${!args_target_range[@]};do
    if [ $(($idx % 2)) -eq 0 ];then
      printf "\\t${args_target_range[$idx]}\\n"
    fi
  done
  printf "self-contained args : \\n"
  for idx in ${!test_args[@]};do
    if [ $(($idx % 2)) -eq 0 ];then
      printf "\\t${test_args[$idx]}\\n"
    fi
  done
  exit  # print help text and exit
fi

# process args targeting ip address
for idx in ${!args_target_ip[@]};do
  if [ $1 == "${args_target_ip[$idx]}" ] && [ $(($idx % 2)) -eq 0 ];then
    command="nmap ${args_target_ip[$idx+1]} $ip_target"
    execute "$command"
    exit  # execute command and exit
  fi
done

# process args targeting range
for idx in ${!args_target_range[@]};do
  if [ $1 == "${args_target_range[$idx]}" ] && [ $(($idx % 2)) -eq 0 ];then
    command="nmap ${args_target_range[$idx+1]} $ip_range"
    execute "$command"
    exit  # execute command and exit
  fi
done

# process test args
for idx in ${!test_args[@]};do
  if [ $1 == "${test_args[$idx]}" ] && [ $(($idx % 2)) -eq 0 ];then
    command=${test_args[$idx+1]}
    execute "$command"
    exit  # execute command and exit
  fi
done

# execute all args
for idx in ${!args_target_ip[@]};do
  if [ $1 == all ] && [ $(($idx % 2)) -eq 0 ];then
    command="nmap ${args_target_ip[$idx+1]} $ip_target"
    execute "$command"
  fi
done

