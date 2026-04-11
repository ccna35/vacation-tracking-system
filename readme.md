# Vacation Tracking System

## Vision

The main goal of this application is to improve the
internal business processes of
this organization, at least with respect to
the time it takes to manage vacation time
requests

## Function Requirements

- Employees can see their balances.
- Employees can see their balances.
- Employees can create a leave request.
- Employees can choose a leave type.
- Employees can specify dates.
- Employees may add a note or attachment.
- Someone above them reviews it.
- The request gets approved, rejected, or sent back.W
- If approved, the balance changes and the calendar of availability changes too.

* HR may define leave policies.
* The company may have annual leave, sick leave, unpaid leave, emergency leave, compensatory leave.
* It may stop people from requesting more than they own.
* It may detect overlap with existing approved requests.
* It may show team calendar conflicts.
* It may produce reports.

## Non-Function Requirements

- clear response times,
- reliable calculations,
- role-based access,
- traceable approval history,
- data consistency,
- reasonable usability,
- and maybe support for future company growth.

# Constraints

- Leave cannot be approved without a manager.
- HR policy require storing approval records.
- Existing employee master data lives in another system.
- payroll already exists and the VTS cannot redefine employee identity.
- First release must be web-only.
- The organization wants a simple internal app, not a giant platform.

# Domain

A company needs a controlled way to represent employee time away from work, decide whether it is allowed, maintain balances fairly, and make the result visible to the right people at the right time.

# List Actors of the system

- Employee
- Manager
- HR
- System Admin

# Use Case (Manage Time)

## Flow Chart

![This is an alt text.](/diagrams/FlowChartCreateRequestLeave.jpeg "This is a sample image.")
