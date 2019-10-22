# External section5 specific config:

rv32ui_s5_tests = $(addprefix rv32ui-s5-, $(rv32ui_sc_tests))
spike32_tests = $(rv32ui_s5_tests)


define custom_compile_template

$$($(1)_s5_tests): $(1)-s5-%: $(1)/%.S
	$$(RISCV_GCC) $(2) $$(RISCV_GCC_OPTS) -I$(src_dir)/../env/s5 -I$(src_dir)/macros/scalar -T$(src_dir)/../env/s5/link.ld $$< -o $$@
$(1)_tests += $$($(1)_s5_tests)

endef

$(eval $(call custom_compile_template,rv32ui,-march=rv32g -mabi=ilp32))

debug:
	@echo $(tests)

