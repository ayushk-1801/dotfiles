TODO_FILE="$HOME/todos"

TODO_COUNT=$(wc -l < "$TODO_FILE")

echo "$TODO_COUNT"
