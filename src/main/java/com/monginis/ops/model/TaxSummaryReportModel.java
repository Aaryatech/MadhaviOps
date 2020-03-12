package com.monginis.ops.model;

import java.util.List;

public class TaxSummaryReportModel {

	private List<GetRepTaxSell> taxReport;
	private List<FrInvoiceIssued> issueReport;

	public List<GetRepTaxSell> getTaxReport() {
		return taxReport;
	}

	public void setTaxReport(List<GetRepTaxSell> taxReport) {
		this.taxReport = taxReport;
	}

	public List<FrInvoiceIssued> getIssueReport() {
		return issueReport;
	}

	public void setIssueReport(List<FrInvoiceIssued> issueReport) {
		this.issueReport = issueReport;
	}

	@Override
	public String toString() {
		return "TaxSummaryReportModel [taxReport=" + taxReport + ", issueReport=" + issueReport + "]";
	}

}
