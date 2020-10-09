NAME ?= Sengkuni-Kernel-Ten

DATE := $(shell date +'%d%m%Y')

ZIP := $(NAME)-$(DATE).zip

EXCLUDE := Makefile *.git*

all: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."

clean:
	@rm -vf *.zip*
	@rm -vf Image.gz-dtb
	@echo "Done."
