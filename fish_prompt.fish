function fish_prompt
    set -l git_color normal
    set -l dollar_color normal
    set -l untracked ""

    if git_is_staged
        set git_color green

        if git_is_dirty
            set dollar_color red
        end

    else if git_is_dirty or git_is_touched
        set git_color red
    end

    set untracked_files (git_untracked_files)

    if test "$untracked_files" -gt 0
        set untracked "|$untracked_files"
    end

    set_color $git_color
    printf '(%s%s)' (git_branch_name) $untracked
    set_color $dollar_color
	echo -n '$ '
end
