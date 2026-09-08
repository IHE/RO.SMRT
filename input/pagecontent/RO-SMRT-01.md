This section corresponds to transaction [RO-YY] of the IHE-RO Technical Framework.

### Scope

This transaction is used to send the patient fave photo from the ROIS to the TMS.

### Actors Roles

The roles in this transaction are defined in the following table and may be played by the actors shown here:

<p id ="t3.YY.2-1" class="tableTitle"><strong>Table 2:3.YY.2-1: Actor Roles</strong></p>

| Role      | Description                               | Actor(s)          |
|-----------|-------------------------------------------|-------------------|
| Sender    | Sends patient face photo                  | [ROIS](volume-1.html#radiation-oncology-information-system) |
| Receiver  | Receives patient face photo message       | [TMS](volume-1.html#treatment-management-system) |
{: .grid}

### Referenced Standards

- **FHIR-R4** [HL7 FHIR Release 4.0]({{site.data.fhir.path}})

### Interactions

<figure>
{%include RO-SMRT-01-seq.svg%}
<figcaption><strong>Figure X.X.X.X-X: Send Patient Face Photo Interaction Diagram</strong></figcaption>
</figure>
<br clear="all"/>

#### Send Patient Face Photo Message

##### Trigger Events

''TODO: define the triggers''

##### Message Semantics

''TODO: define the message -- usually with a StructureDefintion''

##### Expected Actions

''TODO: define expected actions''

#### Response Message

##### Trigger Events

''TODO: define the triggers''

##### Message Semantics

''TODO: define the message -- usually with a StructureDefintion''

##### Expected Actions

''TODO: define expected actions''

### CapabilityStatement Resource

Requesters and Responders implementing this transaction SHALL provide a `CapabilityStatement` Resource as described in [ITI TF-2: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating the transaction has been implemented. 

* Requirements CapabilityStatement for [TMS](CapabilityStatement-IHE.SMRT.tms.html)
* Requirements CapabilityStatement for [ROIS](CapabilityStatement-IHE.SMRT.rois.html)

### Security Considerations

See [SMRT Security Considerations](volume-1.html#security-considerations)

#### Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit

When grouped with ATNA Secure Application or Secure Node the Actor shall be able to record... 

''TODO: the specifics, leveraging BALP''

##### Server Audit

When grouped with ATNA Secure Application or Secure Node the Actor shall be able to record... 

''TODO: the specifics, leveraging BALP''

{% include link-list.md %}