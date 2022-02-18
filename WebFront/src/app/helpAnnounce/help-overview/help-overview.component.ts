import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { Help } from '../../help-definition/help';

@Component({
  selector: 'app-help-overview',
  templateUrl: './help-overview.component.html',
  styleUrls: ['./help-overview.component.scss']
})
export class HelpOverviewComponent implements OnInit {
  @Input() public help?: Help;   
  constructor(private router: Router) { }

  ngOnInit(): void {
  }

  goToHelpDetailPage() {
    this.router.navigate(["helps/",this.help?.id,"detail"]);
  }

}
