Profile: PlanApprovalProvenance
Parent: Provenance
Id: plan-approval-provenance
Title: "SMRT Plan Approval Provenance Profile"
Description: "Represents the approval of a treatment plan. The profile is intended to be used as the focal resource of a FHIR Message Bundle conveying a Plan Approved event."
* ^status = #active
* id 1.. MS
* recorded 1..1 MS
* target 1..* MS
* activity 1..1 MS
* target only Reference(PlanImagingStudy)  // we may also include DocumentReference
* agent.who 1..1 MS
* activity from PlanApprovalActivityValueSet (required)
