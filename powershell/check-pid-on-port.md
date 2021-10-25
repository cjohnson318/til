# Check PID on Port

To get the PID of a process using a port:

```powershell
netstat -nao | select-string "8080"
```