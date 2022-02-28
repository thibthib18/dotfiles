require "format".setup {
    ["*"] = {
        {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
    },
    vim = {
        {
            cmd = {"luafmt -w replace"},
            start_pattern = "^lua << EOF$",
            end_pattern = "^EOF$"
        }
    },
    lua = {
        {cmd = {"luafmt -w replace"}}
    },
    cpp = {
        {cmd = {"clang-format-10 --style=file --i"}}
    },
    python = {
        {cmd = {"yapf -i -vv --style ~/main/.style.yapf"}}
    },
    javascript = {
        {cmd = {"npm run pretty-quick"}}
    },
    markdown = {
        {cmd = {"prettier -w"}},
        {
            cmd = {"black"},
            start_pattern = "^```python$",
            end_pattern = "^```$",
            target = "current"
        }
    }
}
