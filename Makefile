build:
	docker run -u `id -u` -v `pwd`:/workdir -t hjacobs/nikola build

clean:
	docker run -u `id -u` -v `pwd`:/workdir -t hjacobs/nikola clean
