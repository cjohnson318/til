# Increase Storage for Windows EC2

## Overview
s
You'll first increase size of the root volume, and then, from within the EC2,
you'll extend the volume by opening a dialog by running `diskmgmt.msc` in a
Windows terminal.

## From AWS Console (aws.amazon.com)

  1. From the Amazon **EC2 console**, choose **Instances** from the navigation pane.
  2. Select the instance that you want to expand. From the Description tab, choose the volume listed for **Block devices**. Then, choose the **EBS ID**.
  3. Select the volume. For **Actions**, choose **Modify Volume**.
  4. In the **Size** field, enter the Size. If you choose an io1 volume, enter the number of IOPS.
  5. Choose **Modify**, and then choose **Yes**. Refresh the console page. In the Description tab, the State shows the progress of optimization until the modification is complete.

## From inside the Windows EC2

  1. Connect to your EC2 Windows instance using Remote Desktop Protocol (RDP).
  2. Open a command prompt, and then run the `diskmgmt.msc` command. For **Action**, choose **Refresh**.
  3. Open the context (right-click) menu for the Volume, and then choose **Extend Volume**.
  4. Choose **Next**, **Next**, **Finish**.

## Check your work

  1. Still within the Windows EC2, via RDP...
  2. Click **Start**.
  3. Click **Settings**.
  4. Click **System**.
  5. Click **Storage**, and you should see the updated storage size.

[Official Documentation](https://aws.amazon.com/premiumsupport/knowledge-center/expand-ebs-root-volume-windows/)