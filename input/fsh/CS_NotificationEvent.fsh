CodeSystem: NotificationEventCodeSystem
Id: notification-event-codesystem
Title: "Event Notification CodeSystem"
Description: "Concepts describing the purpose of the SMRT Event Notification. Note these concepts are 'pre-coordinated' to represent the concept of notification message *AND* the event that triggers the notification."
* ^status = #active
* ^caseSensitive = true
* ^hierarchyMeaning = #is-a
* ^content = #complete
* ^count = 4
* #notification-planning-artifacts-ready "Planning Artifacts Ready Notification" "Notify the ROIS that the planning artifacts are ready."
* #notification-delivery-artifacts-ready "Delivery Artifacts Ready Notification" "Notify the ROIS that the delivery artifacts are ready."
* #notification-session-artifacts-ready "Session Artifacts Ready Notification" "Notify the ROIS that the session artifacts are ready."
* #notification-plan-approval "Plan Approval Notification" "Notify the ROIS that the plan approval changed."
