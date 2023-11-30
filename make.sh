#!/bin/sh

iasl -sa ssdt_csc3551.dsl
mkdir -p kernel/firmware/acpi
cp ssdt_csc3551.aml kernel/firmware/acpi/ssdt_csc3551.aml
find kernel | cpio -H newc --create >acpi_override
sudo cp acpi_override /boot/
sudo mkinitcpio -p linux66-tkg-eevdf
