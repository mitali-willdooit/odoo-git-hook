You can enable different commit hooks by following below steps.

1) To enable commit-msg hook:

    Step 1: Copy the code of commit-msg.sh file to this location --> .git>hooks>commit-msg.sample

    Step 2: Rename commit-msg.sample file to "commit-msg".

2) To enable pre-push hook:

    Step 1: Copy the code of pre-push.sh file to this location -> .git>hooks>pre-push.sample

    Step 2: Rename pre-push.sample file to "pre-push"

3) Ignoring Commit hooks:
    - Add "--no-verify" argument to your commit command. Which will ignore commit hook in case you need to commit WIP commits to your branch.
    EX: git commit -m "[WTP]" --no-verify