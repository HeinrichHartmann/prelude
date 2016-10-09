update-prelude:
	git pull origin

commit-user-config:
	git add personal
	git commit -m "Updated personalization"

push-user-config:
	git push HH
