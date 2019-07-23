# reloader
Monitor files pattern by sha sum and execute action if anything changed.

## Use case
- Sidecar pattern as second container at pod that monitor file changes on shared vloumes [1] and send reload action/signal to (main/first) service container.

## ENV Variables

FILES_PATTERN: /etc/*.conf #./path/to/settings/*.conf
ACTION: wget --quiet -c -S http://localhost/reload-endoint-to-another-container-in-same-pod
CHECK_INTERVAL: 2 # optional

|      ENV Name      | Required |                    Example                    |
| -----------------  | :------: | :-------------------------------------------- |
| **FILES_PATTERN**  |    YES   | "/etc/*.conf"  OR "./path/to/settings/*.conf" |
| **ACTION**         |    YES   | "wget --quiet -c -S http://localhost/reload"  OR "/path/to/executable --reload" |
| **CHECK_INTERVAL** |    NO   | 5  (Default value is 1s)   |

## Links
[1] [Communicate Between Containers in the Same Pod Using a Shared Volume](https://kubernetes.io/docs/tasks/access-application-cluster/communicate-containers-same-pod-shared-volume/)
