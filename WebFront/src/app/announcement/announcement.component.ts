import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { Announcement } from '../announcement';

@Component({
  selector: 'app-announcement',
  templateUrl: './announcement.component.html',
  styleUrls: ['./announcement.component.scss']
})
export class AnnouncementComponent implements OnInit {

   @Input() public annonce?: Announcement;
   @Input() style: string = 'web';
   
  constructor(private router: Router) { }

  ngOnInit(): void {
  }

  goToDetailPage() {
    this.router.navigate(["annonces/",this.annonce?.id,"detail"]);
  }

}
