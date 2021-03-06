# ipinfo.io/ip;   ipinfo.io/json
# ifconfig.co/ip;   ifconfig.co/json
# api.ipify.org
function ip {
  local cmd="$1"
  [[ $# > 0 ]] && shift

  case "$cmd" in
    'internal'|'int'|'i')
      __ip::internal $@
      ;;
    'external'|'ext'|'e')
      __ip::external $@
      ;;
    *)
      echo "Unknown command '$cmd'" >&2
      echo "Usage: $0 {internal|external}" >&2
      return 1
      ;;
  esac
}

function __ip::internal {
  local interface=""

  while [[ $# > 0 ]] ; do
    local param_key="$1"
    shift

    case "$param_key" in
      '--interface'|'-i')
        interface="$1"
        shift
        ;;
      *)
        echo "Unknown parameter '$param_key'" >&2
        echo  "Parameter: {--interface <name>}" >&2
        return 1
        ;;
    esac
  done

  if [ -z "$interface" ]; then
    local interface_list=($(ifconfig -l))
    for interface in $interface_list; do
        local ip=$(ipconfig getifaddr $interface)
        if [ -n "$ip" ]; then
          echo "$interface: $ip"
        fi
    done
  else
    echo $(ipconfig getifaddr $interface)
  fi
}

function __ip::external {

  local interface=""
  local details=false

  while [[ $# > 0 ]] ; do
    local param_key="$1"
    shift

    case "$param_key" in
      '--interface'|'-i')
        interface="$1"
        shift
        ;;
      '--details'|'-d')
        details="true"
        ;;
      *)
        echo "Unknown parameter '$param_key'" >&2
        echo "Parameter: {--details|--interface <name>}" >&2
        return 1
        ;;
    esac
  done

  local interface_param
  if [ -n "$interface" ]; then
    interface_param=(--interface $interface)
  fi

  local address="ipinfo.io/ip"
  if $details; then
    address="ipinfo.io/json"
  fi

  curl $interface_param $address
}