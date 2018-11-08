# make gh-pages in repo base directory to automatically build and deploy documents to github

gh-pages:
	echo "Make gh-pages"

	cp notebooks/* docs/.

	cd docs; make html
	git checkout gh-pages
	rm -rf _sources _static _modules _images
	mv -fv docs/_build/html/* .
	rm -rf docs
	git add -A
	git commit -m "Generated gh-pages for `git log master -1 --pretty=short --abbrev-commit`" && git push scikit gh-pages ; git checkout master
