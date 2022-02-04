import { Component, OnInit } from '@angular/core';
import { Announcement } from '../announcement';
import { AnnouncementService } from '../announcement.service';
import { ActivatedRoute,  Router, RouterLink} from '@angular/router';

@Component({
  selector: 'app-map',
  templateUrl: './map.component.html',
  styleUrls: ['./map.component.scss']
})
export class MapComponent implements OnInit {

  public annonce?: Announcement;

  constructor(private annonceService: AnnouncementService, private route: ActivatedRoute, private router: Router) { }

  ngOnInit(): void {
    const routeParams = this.route.snapshot.paramMap;
    const annonceId = Number(routeParams.get('annonceId'));
    this.annonce = this.annonceService.getAnnouncement(annonceId);
  }

}
